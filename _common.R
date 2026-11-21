set.seed(5678)

# Load libraries and options
library(knitr)
library(here)
library(tidyverse)
library(kableExtra)
library(lubridate)

options(dplyr.width = Inf)
options(knitr.kable.NA = '')

knitr::opts_chunk$set(
    message = FALSE,
    warning = FALSE,
    comment    = "#>",
    fig.retina = 3,
    fig.width  = 6,
    fig.height = 4,
    fig.show = "hold",
    fig.align  = "center",
    fig.path   = "figs/"
)

make_rubric <- function(rubric) {
  rubric %>%
    mutate(description = paste0("<b>", points, '</b><br>', description)) %>%
    select(-points) %>%
    spread(key = rating, value = description) %>%
    select(-category) %>%
    rename(Category = label) %>%
    arrange(order) %>%
    select(-order) %>%
    select(-maxPoints) %>%
    kable(format = 'html', escape = FALSE) %>%
    kable_styling(bootstrap_options = "striped")
}

# Load the course schedule from schedule.csv and build the html-formatted
# columns used by schedule.qmd and the build / project fragments. Same
# approach as the P4A site: one block per column, joined on `week`.

get_schedule <- function() {

    schedule_raw <- read_csv(here::here('schedule.csv'))

    # Quiz vars
    quiz <- schedule_raw %>%
        mutate(
            quiz = ifelse(
                is.na(quiz),
                "",
                paste0('Quiz ', quiz, ":<br><em>", quiz_coverage, "</em>"))
        ) %>%
        select(week, quiz)

    # Concept (class) vars: link to the class page when a stub is provided
    class <- schedule_raw %>%
        mutate(
            description_class = ifelse(
                is.na(description_class),
                "",
                description_class),
            class = ifelse(
                is.na(stub_class),
                paste0("<b>", name_class, "</b><br>", description_class),
                paste0(
                    '<a href="class/', n_class, "-", stub_class, '.html"><b>',
                    name_class, "</b></a><br> ",
                    description_class))
        ) %>%
        select(week, class)

    # Building vars: the kind of artifact we're making (can span weeks)
    building <- schedule_raw %>%
        mutate(building = ifelse(is.na(building), "", building)) %>%
        select(week, building)

    # Build assignment vars
    assignments <- schedule_raw %>%
        mutate(
            due_assign_md = format(due_assign, format = "%b %d"),
            assignments = ifelse(
                is.na(due_assign),
                "",
                paste0(
                    '<a href="hw/', n_assign, "-", stub_assign,
                    '.html"><b>Build ', n_assign, ": ", name_assign,
                    "</b></a><br>Due: ", due_assign_md))
        ) %>%
        select(week, assignments)

    # Final project vars
    project <- schedule_raw %>%
        mutate(
            due_project_md = format(due_project, format = "%b %d"),
            project = ifelse(
                is.na(due_project),
                "",
                paste0(
                    '<a href="project/', n_project, "-", stub_project,
                    '.html"><b>', name_project, "</b></a><br>Due: ",
                    due_project_md))
        ) %>%
        select(week, project)

    # Final schedule data frame. The raw n_assign / due_assign and
    # n_project / due_project columns are kept for the hw and project
    # fragments, which look up their own due dates.
    schedule <- schedule_raw %>%
        select(week, date, n_assign, due_assign, n_project, due_project) %>%
        mutate(
            date_md = format(date, format = "%b %d"),
            due_assign = format(due_assign, format = "%b %d"),
            due_project = format(due_project, format = "%b %d")
        ) %>%
        left_join(quiz, by = "week") %>%
        left_join(class, by = "week") %>%
        left_join(building, by = "week") %>%
        left_join(assignments, by = "week") %>%
        left_join(project, by = "week") %>%
        ungroup()

    return(schedule)
}

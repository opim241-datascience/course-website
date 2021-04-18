library(dplyr, quietly = T, warn.conflicts = F)
library(stringr, quietly = T, warn.conflicts = F)

noclass <- as.Date(c("2021-03-29"))

sched_vec <- c(
  seq.Date(
    from = as.Date("2021-03-15"),
    to = as.Date("2021-05-03"),
    by = "week"
  )
) %>%
  .[!(. %in% noclass)] %>%
  sort(.)

sched <-
  tibble(date = sched_vec) %>%
  mutate(session = as.integer(1:nrow(.)))

## Sessions

l01 <- tibble(
  topics = "Intro to Data Science. Toolkit: R, RStudio, git, GitHub",
  lab = "Lab 1",
  reading = "",
  notes = ""
)

l02 <- tibble(
  topics = "Visualizing data",
  lab = "Lab 2",
  reading = "R4DS: Ch. 2,3",
  notes = "Assignment 1 due before class"
)


l03 <- tibble(
  topics = "Wrangling: manipulating and summarizing data",
  lab = "Lab 3",
  reading = "R4DS: Ch.4,5,6",
  notes = "Assignment 2 due before class"
)

l04 <- tibble(
  topics = "Wrangling: joining, recoding and reading data",
  lab = "Lab 4",
  reading = "R4DS: Ch. 7,18,19",
  notes = "Assignment 3 due before class"
    )

l05 <- tibble(
  topics = "Modeling data: regression",
  lab = "Lab 5",
  reading = "",
  notes = "Assignment 4 due before class"
)

l06 <- tibble(
  topics = "Modeling data: classificatio and model validation",
  lab = "Lab 6",
  reading = "",
  notes = "Assignment 5 due before class"
)

l07 <- tibble(
  topics = "Business Case Study",
  lab = "Lab 7",
  reading = "",
  notes = "Assignment 6 due before class"
)

sessions <- paste0("l", str_pad(as.character(1:7), 2, pad = "0"))

sched <- sched %>%
  bind_cols(lapply(sessions, get) %>%  bind_rows())

sched <- 
  sched %>%
  mutate(date = format(date, "%a %b-%d")) %>%
  select(session, date, topics, lab, reading, notes)

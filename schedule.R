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
  lab = "",
  reading = "",
  notes = ""
)

l02 <- tibble(
  topics = "Visualizing data",
  lab = "",
  reading = "R4DS: Ch. 2,3",
  notes = ""
)


l03 <- tibble(
  topics = "Importing, wrangling, recoding and tidying data",
  lab = "",
  reading = "R4DS: Ch.4,5,6,7,18,19.1-19.3",
  notes = ""
)

l04 <- tibble(
  topics = "Communicating data science results effectively",
  lab = "",
  reading = "R4DS: Ch. 9",
  notes = ""
)

l05 <- tibble(
  topics = "Modeling data: regression",
  lab = "",
  reading = "R4E: Ch. 19",
  notes = ""
)

l06 <- tibble(
  topics = "Modeling data: classification. Model validation.",
  lab = "",
  reading = "R4E: 20.1, ",
  notes = ""
)

l07 <- tibble(
  topics = "Business Case Study",
  lab = "",
  reading = "",
  notes = ""
)


sessions <- paste0("l", str_pad(as.character(1:7), 2, pad = "0"))

sched <- sched %>%
  bind_cols(lapply(sessions, get) %>%  bind_rows())

sched <- 
  sched %>%
  mutate(date = format(date, "%a %b-%d")) %>%
  select(session, date, topics, lab, reading, notes)

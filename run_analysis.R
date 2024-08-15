# Load libraries
library(dplyr)
library(readr)

# Function to read and combine train and test data
read_and_combine <- function(train_file, test_file) {
  train_data <- read_table(train_file, col_names = FALSE)
  test_data <- read_table(test_file, col_names = FALSE)
  combined_data <- bind_rows(train_data, test_data)
  return(combined_data)
}

# Add activity labels
activity_labels <- read_table("activity_labels.txt", col_names = c("activity_id", "activity_name"))

# Read and combine subject data
subject_data <- read_and_combine("train/subject_train.txt", "test/subject_test.txt")
colnames(subject_data) <- "subject_id"

# Read and combine activity data (y files)
activity_data <- read_and_combine("train/y_train.txt", "test/y_test.txt")
colnames(activity_data) <- "activity_id"

# Read and combine feature data (X files)
feature_data <- read_and_combine("train/X_train.txt", "test/X_test.txt")

# Read feature names
feature_names <- read_table("features.txt", col_names = c("feature_id", "feature_name"))
colnames(feature_data) <- feature_names$feature_name

# Read and combine Inertial Signals data
inertial_signals <- c("total_acc_x", "total_acc_y", "total_acc_z", 
                      "body_acc_x", "body_acc_y", "body_acc_z", 
                      "body_gyro_x", "body_gyro_y", "body_gyro_z")

inertial_data <- lapply(inertial_signals, function(signal) {
  read_and_combine(paste0("train/Inertial Signals/", signal, "_train.txt"),
                   paste0("test/Inertial Signals/", signal, "_test.txt"))
})

names(inertial_data) <- inertial_signals

# Combine all data into a single dataset
combined_data <- bind_cols(
  subject = subject_data,
  activity = activity_data,
  features = feature_data,
  inertial_data
)

# Join with activity labels to get descriptive activity names
combined_data <- combined_data %>%
  left_join(activity_labels, by = "activity_id") %>%
  select(subject_id, activity_id, activity_name, everything())

# Save the combined dataset with error handling
tryCatch({
  output_file <- file.path(getwd(), "combined_dataset.csv")
  write_csv(combined_data, output_file)
  print(paste("Data merging completed. The combined dataset is saved as:", output_file))
  print(paste("File size:", file.size(output_file) / 1e6, "MB"))
}, error = function(e) {
  print(paste("Error saving file:", e$message))
})

# Check if file exists and is readable
if (file.exists("combined_dataset.csv")) {
  if (file.access("combined_dataset.csv", mode = 4) == 0) {
    print("File is readable")
  } else {
    print("File exists but is not readable")
  }
} else {
  print("File does not exist")
}

# Read the combined dataset created in my previous script
combined_data <- read_csv("combined_dataset.csv")

# Identify columns containing mean or standard deviation measurements
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", names(combined_data), value = TRUE)

# Add subject_id, activity_id, and activity_name to the selected columns
selected_cols <- c("subject_id", "activity_id", "activity_name", mean_std_cols)

# Create a new dataset with my selected columns
mean_std_data <- combined_data %>% select(all_of(selected_cols))

# View the first few rows and the structure of the new dataset
print(head(mean_std_data))
print(str(mean_std_data))

# Save the mean and std dataset
write_csv(mean_std_data, "mean_std_dataset.csv")
print(paste("Mean and std dataset saved as: mean_std_dataset.csv"))
print(paste("Mean and std dataset size:", file.size("mean_std_dataset.csv") / 1e6, "MB"))

# Print the number of columns in the new dataset
print(paste("Number of columns in mean and std dataset:", ncol(mean_std_data)))

# Add more descriptive labels
#Read the combined dataset created by the previous script
combined_data <- read_csv("combined_dataset.csv")

# Identify columns containing mean or standard deviation measurements
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", names(combined_data), value = TRUE)

# Add subject_id, activity_id, and activity_name to the selected columns
selected_cols <- c("subject_id", "activity_id", "activity_name", mean_std_cols)

# Create a new dataset with only the selected columns
mean_std_data <- combined_data %>% select(all_of(selected_cols))

# Print current column names
print("Current column names:")
print(names(mean_std_data))

# Function to make names more descriptive
make_descriptive <- function(name) {
  name <- gsub("^t", "time", name)
  name <- gsub("^f", "frequency", name)
  name <- gsub("Acc", "Accelerometer", name)
  name <- gsub("Gyro", "Gyroscope", name)
  name <- gsub("Mag", "Magnitude", name)
  name <- gsub("mean\\(\\)", "Mean", name)
  name <- gsub("std\\(\\)", "StandardDeviation", name)
  name <- gsub("-X", "XAxis", name)
  name <- gsub("-Y", "YAxis", name)
  name <- gsub("-Z", "ZAxis", name)
  return(name)
}

# Apply the function to make names more descriptive
names(mean_std_data) <- sapply(names(mean_std_data), make_descriptive)

# Print new column names
print("New, more descriptive column names:")
print(names(mean_std_data))

# View the first few rows and the structure of the new dataset
print(head(mean_std_data))
print(str(mean_std_data))

# Save the mean and std dataset with descriptive variable names
write_csv(mean_std_data, "mean_std_dataset_descriptive.csv")
print(paste("Mean and std dataset with descriptive names saved as: mean_std_dataset_descriptive.csv"))
print(paste("Dataset size:", file.size("mean_std_dataset_descriptive.csv") / 1e6, "MB"))

# Print the number of columns in the new dataset
print(paste("Number of columns in mean and std dataset:", ncol(mean_std_data)))

# Load libraries to create a new dataset with average of each variable for each activity and each subject
library(dplyr)
library(readr)
library(tidyr)

# First, read the mean and std dataset with descriptive variable names
mean_std_data <- read_csv("mean_std_dataset_descriptive.csv")

# Create a tidy dataset with the average of each variable for each activity and subject
tidy_averages <- mean_std_data %>%
  group_by(subject_id, activity_name) %>%
  summarise(across(where(is.numeric), mean, .names = "avg_{.col}"), .groups = "drop") %>%
  arrange(subject_id, activity_name)

# Save the tidy averages dataset
write_csv(tidy_averages, "tidy_averages_dataset.csv")
print(paste("Tidy averages dataset saved as: tidy_averages_dataset.csv"))
print(paste("Dataset size:", file.size("tidy_averages_dataset.csv") / 1e6, "MB"))
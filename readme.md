# Log Archive Tool

A command-line tool to archive and compress logs from a specified directory. This tool helps keep the system clean by moving old logs into compressed archives for future reference. You can customize it to run automatically on a schedule with Cron.

## Features

- **Archives logs from a specified directory into a .tar.gz file.**
- **Stores the compressed archive in a new directory.**
- **Logs the date and time of each archive operation.**
- **You can automate this through cron jobs.**

## Prerequisites

- **Unix-based operating system**
- Bash shell.
- tar installed (available by default in most Unix systems).

## Usage

1. **Clone the repository:**

   Just clone this repository to your local machine:
    
   ```bash
   git clone https://github.com/brandonmdz/log-archive-tool.git
   cd log-archive-tool

2. **Make the script executable:**

   ```bash
   chmod +x log-archive.sh

3. **Run the script:**

   ```bash
   ./log-archive.sh <log-directory> <destination-directory>

`<log-directory:>` Path to the directory containing the logs to archive (e.g., /var/log).

`<destination-directory:>` Path where the compressed archive will be saved.

## Example:

	./log-archive.sh /var/log /home/user/log_archives

   - Here all the files inside the /var/log folder are compressed
   - The archive is saved in /home/user/log_archives with a timestamped name.
   - And finally log the archiving operation to archive_log.txt in the target directory.

## Automation with Cron:

**To run this tool automatically on a schedule, you can set up a cron job:**

- Open the crontab editor:

	```bash
   crontab -e

- Add a cron job to run the script every day at the hour you want, for example at 2:00 AM:

   ```bash
   0 2 * * * /path/to/log-archive.sh /var/log /home/user/log_archives

- Save and exit the editor. The script will now run daily at 2:00 AM.

## Project URL:

This project is one of the many DevOps projects shared by [roadmap.sh](http://roadmap.sh "roadmap.sh"). You can visit this project from the following [URL](https://roadmap.sh/projects/log-archive-tool "URL").

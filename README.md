# COMP-4150 Project - Student Information System
Hello and welcome to our project for COMP-4150 where we have built a Student Information System web application using an [Oracle Database](https://www.oracle.com/ca-en/database/). The project memebers includes

 - Steven Bodnar 
 - Majid Joseph
 - Kolby Sarson

If you are having any difficulties running our project locally, Please [email us](mailto:bodna111@uwindsor.ca;joseph14@uwindsor.ca;sarsonk@uwindsor.ca?subject=COMP-4150%20Setup)

# Software used
- MySQL Database [**link**](https://dev.mysql.com/downloads/mysql/)
- MySQL Workbench [**link**](https://dev.mysql.com/downloads/mysql/)
- Node.js [**link**](https://nodejs.org/en/)

# Setup
## Database Setup
1. Navigate to the MySQL link and download the **MySQL Installer**
2. Open the installer and select "Add.."
3. Under *MySQL Servers* add the latest version to be installed
4. Under *Applications* add MySQL Workbench

We hoped to eliminate any confusion when setting up the environment and have reduced the process to a simple bash script. After installing the required software and cloning the repository. Please open your terminal in the project folder and run the following bash script:
```bash
./dev_startup.sh
```
If you are on **Linux or MacOS** simply run the command in your terminal. For **Windows** please install [GitBash](https://gitforwindows.org/) and run the command in the terminal

# TODO
- [ ] Create section for DB config so users can change there db specific credentials 
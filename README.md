# What is it?
This is a Web Application

# How do I set up?
## Software Requirement
 - Git Bash: https://git-scm.com/
 - Eclipse Java EE IDE for Web Developers
 - Apache Tomcat: http://apache.spinellicreations.com/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.zip
 - Docker: https://www.docker.com/products/overview (Use the steps provided in `Get Started Tutorial` to install as Virtualization must be enabled for certain platforms)
 - Docker Toolbox: https://www.docker.com/products/docker-toolbox
 - SQL Developer: http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html
 
## Environment Setup
 - Clone the repository using  `git clone https://github.com/meelivyas11/Student-Alumni.git` command in Git Bash
 - Open the repository `Student-Alumni` from eclipse IDE
 - Import `Student-Alumni` Project (File->Import->General->Existing Project into Workspace) inside the repository from eclipse IDE
 - Resolve the build path erros by re-adding the jars present in `Jars` folder of the repository
 - Creating a new Apache Tomcat v8.0 server
 - Clean and Build the Project

## Database Setup
 - Using the Kitematic (Docker Toolbox) create a Oracle Container.
 - Use the Container details (system user credentials) to connect to the system user from SQL Developer
 - As a system user, run `StudentAlumni-DB` script in the repository to create STUDENTALUMNI schema and its tables
 - Update the port number in the connenction url (`ORACLE_DB_URL`) in your DBUtils.java file present at  `SGRSApp\src\main\java\sgrs\DataProvider` location inside `StudentGradeRecordingSystem` repository. Also make sure the DB username and password are correct.
 - Clean and build the project again

# How do I use it?
 - Start the Server
 - Open http://localhost:8080/Student-Alumni/ from your web browser
 - Use following credentials to login checkout the features 


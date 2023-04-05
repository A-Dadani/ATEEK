# ATEEK
A seamless platform that connects customers with pharmacists.

## How to run the code locally
### Setup
Running the code is easy. 
First, make sure to have the following pieces of software installed:
- Download and install Node.JS : [Official Node.JS download link](https://nodejs.org/en/download)
- Dowload and install Git for Windows: [Get Git for Windows](https://git-scm.com/download/win)

Then clone the project<br/>

```
git clone https://github.com/A-Dadani/ATEEK
```

CD into the project directory

```
cd ATEEK
```

Remove remote origin

```
git remote remove origin
```
### Running the server
Install all the Node dependencies

```
npm install
```

Start the server

```
npm start
```
***IMPORTANT!***:warning: <br/>
Please make sure that the Node server is running on port 5000, the project will not work otherwise.<br/>
If port 5000 is already taken kindly refer to this article on how to kill a task running on a port: [How to find and kill a process running on a port](https://community.talend.com/s/article/How-to-find-and-kill-a-process-running-on-a-port-LVJkZ?language=en_US).

The server should now be up and listening to port 5000. <br/>
All done! To access the app all you need to do now is to open a new Chrome instance and go to `localhost:5000/`.

## The Stack
**Backend:** Node, Express, JavaScript<br/>
**DataBase and Auth service:** Firebase<br/>
**FrontEnd:** Dart / Flutter<br/>

## Note
- The raw flutter code and the build are in the `_public` directory. [Install the flutter SDK](https://docs.flutter.dev/get-started/install) and feel free to browse edit or build the code!
- Credentials for the test account are
  - Email: `test3@gmail.com`
  - Password: `S3crettt`

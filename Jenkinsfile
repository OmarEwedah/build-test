node {
   try {
     stage('Preparation') {
       git url: 'https://github.com/ahmedmisbah/devops-sample-java-project.git'                        
   }
   
     stage('build, package') {
       sh "mvn clean package"
   }
   
     stage('docker build/push') {
       docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
       def app = docker.build("omarewedah/build-test:latest", '.').push()
     }
   }
    } catch(e) {
    // mark build as failed
     currentBuild.result = "FAILURE";
    // set variables
     def content = '${JELLY_SCRIPT,template="html"}'

    // send email
     emailext(body: content, mimeType: 'text/html',
         subject: "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} ${currentBuild.result}",
         to: 'ewedah88@gmail.com', attachLog: true )

    // mark current build as a failure and throw the error
    throw e;
  }
}
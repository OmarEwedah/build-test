node {
   stage('Preparation') {
     git url: 'https://github.com/OmarEwedah/build-test.git'                        
   }
   
   stage('build, package') {
       sh "mvn clean package"
   }
   
   stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
       def app = docker.build(omarewedah/build-test, '.').push()
     }
   }
}
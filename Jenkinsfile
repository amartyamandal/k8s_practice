node {
   
    def app

    stage('Clone repository') {
           echo "Clone Repo"
           echo "$HOME"
           sh 'pwd'
           sh 'whoami'
          
    }

    stage('usernamePassword') {
      
        script {
          withCredentials([
            usernamePassword(credentialsId: 'mydockerhub',
              usernameVariable: 'username',
              passwordVariable: 'password')
          ]) {
            print 'username=' + username + 'password=' + password

            sh 'sudo docker login -u='+ username + ' -p=' + password
          }
        }
     
    }
   
    stage('Build image') {
        
        echo "Build Image"
       
       
    }

    stage('Test image') {
        
        echo "Test Image"
    }

    stage('Push image') {
        
        echo "Push Image"
     
    }
}

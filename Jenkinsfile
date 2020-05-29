node {
   
    def app

    stage('Clone repository') {
           echo "Clone Repo"
           echo "$HOME"
           sh 'pwd'
           sh 'whoami'
           sh 'docker'
    }

    stage('usernamePassword') {
      steps {
        script {
          withCredentials([
            usernamePassword(credentialsId: 'mydockerhub',
              usernameVariable: 'username',
              passwordVariable: 'password')
          ]) {
            print 'username=' + username + 'password=' + password

            print 'username.collect { it }=' + username.collect { it }
            print 'password.collect { it }=' + password.collect { it }
          }
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

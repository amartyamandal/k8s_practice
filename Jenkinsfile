node {
   
    def app

    stage('Clone repository') {
           echo "Clone Repo"
           echo "$HOME"
           sh 'pwd'
           sh 'whoami'
          
   }
   
   environment {
    registry = "amartyamandal/simpleserver"
    registryCredential = 'mydockerhub'
   } 
    
   stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    

    stage('Test image') {
        
        echo "Test Image"
    }

    stage('Push image') {
        
        echo "Push Image"
     
    }
}

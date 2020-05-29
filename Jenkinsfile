node {
   
    def app

    stage('Clone repository') {
           echo "Clone Repo"
           echo "$HOME"
           sh 'pwd'
           sh 'whoami'
          
   }
   
   
    
   stage('Building image') {
      
        echo "Building Image"
        sh 'docker run hello-world'
     
    }
    

    stage('Test image') {
        
        echo "Test Image"
    }

    stage('Push image') {
        
        echo "Push Image"
     
    }
}

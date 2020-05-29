node {
    def app

    environment {
        registrySimpleServer = "amartyamandal/simpleserver"
        registrySimpleProxy = "amartyamandal/simpleproxy"
        registryCredential = 'mydocker'
    }

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        /*checkout scm*/
        echo "Clone Repo"
        /*git 'https://github.com/amartyamandal/k8s_practice.git'*/
        /*docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"*/

    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        /*app = docker.build("getintodevops/hellonode")*/
        echo "Build Image"
        sh 'npm build'
        /*docker build -f Dockerfile -t $DOCKER_USER_ID/sentiment-analysis-frontend .*/
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        /*app.inside {
            sh 'echo "Tests passed"'
        }*/
        echo "Test Image"
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        echo "Push Image"
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest") 
            
        }
        
    }
}

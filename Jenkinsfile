
pipeline {
    agent {
            node {
                
                    def appsimpleserver
                    def appsimpleproxy
                    stage('Clone repository') {
                        /* Let's make sure we have the repository cloned to our workspace */

                        checkout scm
                    }

                    stage('Build image') {
                        /* This builds the actual image; synonymous to
                        * docker build on the command line */
                        /*sh 'whoami'*/
                        appsimpleserver = docker.build("amartyamandal/simpleserver:${env.BUILD_ID}","-f NodeJSWebServer-master/Dockerfile NodeJSWebServer-master/.")
                        appsimpleproxy = docker.build("amartyamandal/simpleproxy:${env.BUILD_ID}","-f NodejsProxy-master/Dockerfile NodejsProxy-master/.")

                    }

                    stage('Test image') {
                        /* Ideally, we would run a test framework against our image.
                        * For this example, we're using a Volkswagen-type approach ;-) */

                        appsimpleserver.inside {
                            sh 'echo "Tests passed"'
                        }
                    }

                    stage('Push image') {
                        /* Finally, we'll push the image with two tags:
                        * First, the incremental build number from Jenkins
                        * Second, the 'latest' tag.
                        * Pushing multiple tags is cheap, as all the layers are reused. */
                        docker.withRegistry('https://registry.hub.docker.com', 'mydockerhub') {
                            appsimpleserver.push("${env.BUILD_NUMBER}")
                            appsimpleserver.push("latest")

                            appsimpleproxy.push("${env.BUILD_NUMBER}")
                            appsimpleproxy.push("latest")

                        }
                    }
                    stage('Clean Docker Images') {

                        sh 'yes | docker system prune -a'
                    }
                
            }
    }
    post {
        cleanup {
            /* clean up our workspace */
            deleteDir()
            /* clean up tmp directory */
            dir("${workspace}@tmp") {
                deleteDir()
            }
            /* clean up script directory */
            dir("${workspace}@script") {
                deleteDir()
            }
        }
    }
}

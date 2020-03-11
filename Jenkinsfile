pipeline {
		
     environment {
    	registry = "hassandocker1/calculator"
    	registryCredential = 'dockerhub'
    	dockerImage = ''
     }
	
     agent any

     stages {
          stage("Compile") {
               steps {
                    sh "./gradlew compileJava"
               }
          }
         
          stage("Package") {
               steps {
                    sh "./gradlew build"
               }
          }

          stage('Building image') {
                steps{
                  script {
		      sh 'pwd'	
                      dockerImage = docker.build(registry + ":$BUILD_NUMBER", ".")
                  }
                }
          }
          	     
          stage('Docker Push') {
                steps{
                  script {
                    docker.withRegistry( '', registryCredential ) {
                          dockerImage.push()
                    }
                  }  
                }
          }

          stage("Deploy to staging") {
               steps {
            
                   // sh "docker run -d --rm -p 8765:8080 --name calculator_1 nikhilnidhi/calculator_1"
               sh "docker-compose up -d"
               }
          }

          stage("Acceptance test") {
               steps {
                    sleep 60
                    sh "./acceptance_test_docker.sh"
               }
          }
             
          post {
               always {
                   sh "docker-compose down"
               }
          }
      }
}

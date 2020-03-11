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
      }
}

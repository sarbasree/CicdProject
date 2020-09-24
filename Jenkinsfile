pipeline {
    agent any
   
    stages {
   
        stage('Build') {
            steps {
               git credentialsId: 'jenkins', url: 'https://github.com/sarbasree/CicdProject.git'
            }
        }
        stage('Package') {
			steps {
				script {
					echo "Build Started";
                    bat 'java -version'
					bat 'mvn -version'
					//bat 'mvn clean package';
					def mvnHome = tool name: 'maven-3', type: 'maven'
          	        bat "${mvnHome}/bin/mvn package"
				}
			}
      	}
	  
        
        stage('Build and push image') {
			options {
				skipDefaultCheckout true;
			}
			steps {
					script {
						bat "docker build -t sarbasree/cicdproject:0.1.2 . ";
                        docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {
                        bat "docker push sarbasree/cicdproject:0.1.2"
                        }
					}
				}
			}
		}
    }

	

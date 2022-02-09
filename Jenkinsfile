pipeline {
    agent any
    
    tools{
        maven 'MAVEN_HOME'
    }
    
    stages{
        
        stage("checkout") {
          steps{
           checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sravz8184/sample-java-']]]) 
            }
          }
        
        stage("build") {
          steps{
            bat 'mvn clean install -f pom.xml'
          }  
        }
        stage("test") {
            steps{
             bat 'mvn test -f pom.xml'   
            }
        }
        stage("package") {
            steps{
             bat 'mvn package'        
            }
            post{
                success{
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage("Build Docker Image") {
            steps{
             script{
                  
                 bat 'docker build -t sravz408/my-app:latest .'
                }
            }
        }
        stage("Push docker Image") {
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubp', variable: 'dockerhub')]) {
                    bat 'docker login -u sravz408 -p ${dockerhubp}'
                    
}
                    bat 'docker push sravz408/my-app:latest'
}
               
               
            }
        }
        
        
        
    }
    
}

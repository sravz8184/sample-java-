pipeline {
      agent any

    tools{
        maven 'MAVEN_HOME'
    }
    
    stages{
        
        stage("checkout") {
          steps{
           checkout([$class: 'GitSCM', branches: [[name: '*/output']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sravz8184/sample-java-']]]) 
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
          stage('Mail notification') {
                mail bcc: '', body: 'Package build successfully', cc: '', from: '', replyTo: '', subject: 'jenkins Job', to: 'sravanthi.chn@gmail.com'
          }
     
          stage("Push docker Image"){
            steps{
             script{
                 docker.withRegistry('https://registry.hub.docker.com', 'docker') {

                def customImage = docker.build("sravz408/webapp5")

                /* Push the container to the custom Registry */
                customImage.push()
    }
        }
                      
    }
    
        }
        stage("deploy container"){
           steps{
             script{
                  bat "docker run -p 9090:9090 -d --name webapp4 sravz408/webapp5:latest"
          
        }
           }     
        }
        
    }
}

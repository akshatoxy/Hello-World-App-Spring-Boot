pipeline {
  agent any
  tools {
    maven "maven-3.8"
  }
  stages {
    stage("compile") {
      steps {
        sh "mvn compile"
      }
    }
    stage("test") {
      steps {
        sh "mvn test"
      }
    }
    stage("package") {
      steps {
        sh "mvn package"
      }
    }
    stage("deploy") {
      steps {
        script {
          def ec2Instance = "ec2-user@44.204.68.209"
          def app = "target/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar"

          sshagent(['ec2-server-key']) {
            sh "scp -o StrictHostKeyChecking=no server-cmds.sh ${ec2Instance}:/home/ec2-user"
            sh "scp -o StrictHostKeyChecking=no ${app} ${ec2Instance}:/home/ec2-user"
            sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} bash ./server-cmds.sh"
          }
        }
      }
    }
  }
}

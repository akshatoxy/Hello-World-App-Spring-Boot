pipeline {
  agent any
  tools {
    maven "Maven"
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
  }
}

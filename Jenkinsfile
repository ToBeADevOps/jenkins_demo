pipeline {
  agent {
    node {
      label 'master' 
      customWorkspace 'C:/Users/hell/Desktop/Jenkins/jenkins_demo'
    }
  }
  stages {
    stage('Deploy') {
      agent any
      steps {
        echo 'Deploying'
        sh 'sed -i "s/\r$//" deploy_jenkins.sh && sh deploy_jenkins.sh'
      }
    }
  }
  post {
    always {
      deleteDir()
      echo 'always!'
    }

    changed {
      echo 'changed!'
    }

    success {
      echo 'success!'
    }

    failure {
      echo 'failure!'
    }

    aborted {
      echo 'aborted!'
    }

    unstable {
      echo 'unstable!'
    }

  }
}

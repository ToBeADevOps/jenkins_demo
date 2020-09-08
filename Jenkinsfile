pipeline {
  agent {
    node {
      lable 'master' 
      customWorkspace 'C:/Users/hell/Desktop/Jenkins'
    }
  }
  triggers {
    pollSCM('H/2 * * * *')
  }
  stages {
    stage('Deploy') {
      agent any
      steps {
        echo 'Deploying'
        sh 'sed -i "s/\r$//" deploy_jenkins.sh && ./deploy_jenkins.sh'
      }
    }
  }
  post {
    always {
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

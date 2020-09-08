pipeline {
  agent none
  stages {
    stage('Deploy') {
      agent any
      steps {
        echo 'Deploying'
        sh './deploy_jenkins.sh'
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

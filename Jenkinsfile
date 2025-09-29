pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat '''
                    python -m venv sauce
                    call sauce\\Scripts\\activate
                    python -m pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                bat '''
                    call sauce\\Scripts\\activate
                    robot tests\\test_invalid_credentials.robot
                '''
            }
        }
    }

    post {
        success {
            echo "✅ All tests passed"
        }
        failure {
            echo "❌ Some tests failed — check report in Jenkins"
        }
    }
}
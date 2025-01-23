pipeline {
    agent {
        docker {
            image 'my-jenkins'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Clone repository') {
            steps {
                git branch: 'main', url: 'https://github.com/yarecheg/Labs.git'
            }
        }
        stage('Download DEB package') {
            steps {
                sh '''
                    curl -L https://github.com/yarecheg/Labs/raw/main/packages/count-files_1.0-2_amd64.deb -o /tmp/count-files_1.0-2_amd64.deb
                '''
            }
        }
        stage('Install DEB') {
            steps {
                sh '''
                    sudo dpkg -i /tmp/count-files_1.0-2_amd64.deb
                '''
            }
        }
        stage('Download script') {
            steps {
                sh '''
                    curl -L https://github.com/yarcheg/Labs/raw/main/scripts/count_files.sh -o /tmp/count_files.sh
                    chmod +x /tmp/count_files.sh
                '''
            }
        }
        stage('Run script') {
            steps {
                sh '/tmp/count_files.sh'
            }
        }
    }
}

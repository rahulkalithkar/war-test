node{
    stage('Git Clone'){
        git credentialsId: 'c4d460b6-1252-4a16-9145-38034048870f', url: 'git@github.com:rahulkalithkar/war-test.git'
    }
    
    stage('Build & Test'){
        def mavenHome = tool name: 'maven-3', type: 'maven'
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    
    stage('Docker Build Image'){
        sh 'sudo docker build -t kalithkar/tomcat_webapp:2.0 .'
    }
    
    stage('Docker Image push'){
        withCredentials([string(credentialsId: 'docker_creds', variable: 'docker_pwd')]) {
        sh 'sudo docker login -u kalithkar -p ${docker_pwd}'
        sh 'sudo docker push kalithkar/tomcat_webapp:2.0'
        }
    }
    
    stage('Docker Run Image'){
        sh 'sudo docker run -p 8585:8080 -d kalithkar/tomcat_webapp:2.0'
    }
}
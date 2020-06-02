

 - The Standard k8s-spark execution from Google Kubernetes Service - GKS - Adapted to Spark on BareMetal Kubernetes.



   All operations executed in order :

   ./setup-k8s-spark-workload.sh

         1. spark/install-spark-kubernetes-operator
         2. spark/create-spark-service-account


   ./execute-k8s-spark-workload.sh

         3. default spark-py-pi   OR  pyspark job under folder /jobs 

           i.   spark/run-spark-pi-2k8s-pods
           ii. e.g. ./execute-k8s-spark-workload.sh dataminer-categorized-pdf-to-csv-analytics
 

   Spark Running on Kubernetes

    i. Follow latest Spark.2.4.5 in : https://spark.apache.org/docs/latest/running-on-kubernetes.html 


   Spark Operator from GCP
    i.  https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/blob/master/docs/api-docs.md 
    ii. sparkctl (dedicated kubectl) available from : https://github.com/GoogleCloudPlatform/spark-on-k8s-operator/tree/master/sparkctl

 Notes : Apache Spark in Kubernetes with Fast S3 access layer s3a : https://towardsdatascience.com/apache-spark-with-kubernetes-and-fast-s3-access-27e64eb14e0f


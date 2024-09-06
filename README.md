
# Gatling Test Setup on OpenShift

This repository contains everything you need to run Gatling tests on OpenShift.

## 1. Build the Docker Image

1. Use the provided `Dockerfile` to build the Gatling container image.
   
   ```bash
   docker build -t your-gatling-image .
   ```

2. Push the image to a registry accessible by OpenShift (Docker Hub or OpenShift internal registry):

   ```bash
   docker push your-gatling-image
   ```

## 2. Deploy on OpenShift

### Step 1: Create the Persistent Volume Claim (PVC)

Before running the tests, you need to create a PVC to store the results.

```bash
oc apply -f pvc.yaml
```

### Step 2: Run the Gatling Job

Once the PVC is created, you can run the Gatling job using the following command:

```bash
oc apply -f gatling-job.yaml
```

Make sure to update the `gatling-job.yaml` file with the correct image name that you pushed earlier.

### Step 3: Access the Results

After the test job completes, you can access the results by copying them from the pod to your local machine:

1. Find the pod created by the job:

   ```bash
   oc get pods --selector=job-name=gatling-test-job
   ```

2. Copy the results to your local system:

   ```bash
   oc cp <pod_name>:/opt/gatling/gatling/results ./local-results
   ```

This will download the results, which include HTML reports, to your local system.

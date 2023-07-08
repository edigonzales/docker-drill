# docker-drill

```
docker build -t sogis/drill .
```

```
docker run -it --rm --name drill -p 8047:8047 -p 31010:31010 sogis/drill
```

https://drill.apache.org/docs/running-drill-on-docker/

```
SELECT * FROM cp.`employee.json` LIMIT 3;
```


```
  "type": "file",
  "connection": "s3a://ch.so.data-dev",
  "config": {
    "fs.s3a.aws.credentials.provider": "org.apache.hadoop.fs.s3a.AnonymousAWSCredentialsProvider",
    "fs.s3a.endpoint": "s3.eu-central-1.amazonaws.com",
    "fs.s3a.impl.disable.cache": "false"
  },
  "workspaces": {
    "root": {
      "location": "/",
      "writable": false,
      "defaultInputFormat": null,
      "allowAccessOutsideWorkspace": false
    }
  },
  "formats": {
    "parquet": {
      "type": "parquet"
    },

```


```
SELECT * FROM s3.`ch.so.afu.abfallmengen_gemeinden/ch.so.afu.abfallmengen_gemeinden.parquet`
```

## todo
- override wird nur einmal berücksichtigt? -> https://drill.apache.org/docs/configuring-storage-plugins/#configuring-storage-plugins-with-the-storage-plugins-override.conf-file
- Metastore? https://drill.apache.org/docs/using-drill-metastore/
- Views? oder ähnliches für Auswertungen? Wie verhindert man Schabernack?
- Datenkatalog? Das Gui gibts glaub nicht mehr? 

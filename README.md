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
SELECT * FROM s3.`ch.so.afu.abfallmengen_gemeinden/ch.so.afu.abfallmengen_gemeinden.parquet`;
SELECT * FROM s3.`ch.so.afu.abfallmengen_gemeinden.parquet`;
SELECT max(abfall_kg_pro_einwohner), jahr FROM s3.`ch.so.afu.abfallmengen_gemeinden.parquet` group by jahr order by jahr;
```


 

## todo
- override wird nur einmal berücksichtigt? -> https://drill.apache.org/docs/configuring-storage-plugins/#configuring-storage-plugins-with-the-storage-plugins-override.conf-file
- Metastore? https://drill.apache.org/docs/using-drill-metastore/
- Views? oder ähnliches für Auswertungen? Wie verhindert man Schabernack?
- Datenkatalog? Das Gui gibts glaub nicht mehr? 
- Warum wird `/tmp/drill/sys.storage_plugins` nicht nachgeführt/gelöscht beim Runterfahren? Vielleicht weil im /tmp und nicht eim os-temp? Wenn ichs lösche, funktioniert auch das Rename des Files. /tmp scheint wohl gewollt, weil: https://github.com/apache/drill/blob/master/exec/java-exec/src/test/java/org/apache/drill/test/BaseDirTestWatcher.java#L234C1-L235C1 Falls es scheinbar nicht funktioniert,  sollte man das Log anschauen. Eventuell kann das File nicht geparsed werden, wegen Fehlern. https://drill.apache.org/docs/storage-plugin-registration/
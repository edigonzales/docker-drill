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
SELECT * FROM s3.`ch.so.afu.abfallmengen_gemeinden/ch.so.afu.abfallmengen_gemeinden.parquet`;
SELECT * FROM s3.`ch.so.afu.abfallmengen_gemeinden.parquet`;
SELECT max(abfall_kg_pro_einwohner), jahr FROM s3.`ch.so.afu.abfallmengen_gemeinden.parquet` group by jahr order by jahr;
```
 
## todo
- Metastore? https://drill.apache.org/docs/using-drill-metastore/
- Views? oder ähnliches für Auswertungen? Wie verhindert man Schabernack?
- Datenkatalog? Das Gui gibts glaub nicht mehr? 

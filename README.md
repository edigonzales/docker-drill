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
FROM python:3.12-slim AS build 
WORKDIR /app 
COPY app.py . 
RUN python -m py_compile app.py 
 
FROM python:3.12-slim 
WORKDIR /app 
COPY --from=build /app/app.py . 
CMD ["python","app.py"] 

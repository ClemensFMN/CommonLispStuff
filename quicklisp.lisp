(ql:system-apropos "csv")

(ql:quickload "cl-csv")


(cl-csv:read-csv #P"file.csv")

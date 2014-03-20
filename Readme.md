# HCI GOMS Thing

*Quinn Rohlf*

## Design A

### one-number query

Description | Operation | Time
---|---|---
Locate menu | S | 230 ms
Mouse to menu | P | 1500 ms
Decide on database | M | 1200 ms
Click database | P | 1500 ms
Drag mouse right | P | 1500 ms
Pick query option | P | 1500 ms
Locate dialog box input | S | 230 ms
Mouse to input | P | 1500 ms
Type telephone number | T[8] | 1840 ms
Locate add button | S | 230 ms
Click add button | P | 1500 ms
Locate okay button | S | 230 ms
Click okay button | P | 1500 ms
Total: | | 14.46 seconds

### two-number query

Description | Operation | Time
---|---|---
Locate menu | S | 230 ms
Mouse to menu | P | 1500 ms
Decide on database | M | 1200 ms
Click database | P | 1500 ms
Drag mouse right | P | 1500 ms
Pick query option | P | 1500 ms
Locate dialog box input | S | 230 ms
Mouse to input | P | 1500 ms
Type telephone number | T[8] | 1840 ms
Locate add button | S | 230 ms
Click add button | P | 1500 ms
Locate okay button | S | 230 ms
Click okay button | P | 1500 ms
Locate dialog box input | S | 230 ms
Mouse to input | P | 1500 ms
Type telephone number | T[8] | 1840 ms
Locate add button | S | 230 ms
Click add button | P | 1500 ms
Locate okay button | S | 230 ms
Click okay button | P | 1500 ms
Total: | | 21.49 seconds

## Design B

### one-number query

Description | Operation | Time
---|---|---
Locate telephone number | S | 230 ms
Mouse to telephone number | P | 1500 ms
Decide on database | M | 1200 ms
Click database | P | 1500 ms
Pick query option | P | 1500 ms
Total: | | 5.93 seconds

### two-number query

Description | Operation | Time
---|---|---
Locate telephone number | S | 230 ms
Mouse to telephone number | P | 1500 ms
Decide on database | M | 1200 ms
Click database | P | 1500 ms
Pick query option | P | 1500 ms
Locate telephone number | S | 230 ms
Mouse to telephone number | P | 1500 ms
Decide on database | M | 1200 ms
Click database | P | 1500 ms
Pick query option | P | 1500 ms
Total: | | 11.86 seconds

## Notes

I probably spent about an hour writing the code to generate these tables and twenty minutes building the models that give the estimates in this file.

The `hci-goms.rb` file (listed above) generates this file as well as an html file when `ruby hci-goms.rb` is run.
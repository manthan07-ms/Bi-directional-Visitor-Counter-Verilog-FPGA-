# Bi-directional-Visitor-Counter-Verilog-FPGA-
📌 Project Overview

This project implements a bidirectional visitor counter using Verilog HDL.
It counts the number of people entering and exiting a room using two sensors and displays the total count on three 7-segment displays (hundreds, tens, ones).

The design is suitable for implementation on FPGA boards such as Altera DE2 / Cyclone series.

⚙️ Features

✅ Bidirectional counting (Entry & Exit detection)
✅ Maximum count: 999
✅ Automatic decrement on exit
✅ Three 7-segment display output
✅ Slow clock generation for stable sensor reading
✅ Reset functionality

🧠 Working Principle

Two inputs (entry and exit) act as IR sensors
On a falling edge of entry, the count increments
On a falling edge of exit, the count decrements
A slow clock is generated internally using a counter to avoid false triggering
The total count is split into:
Hundreds digit
Tens digit
Ones digit
Each digit is decoded and displayed on a 7-segment display

🧩 Module Description
Inputs

Signal	  Description
clk	    | Main FPGA clock
reset	  | Resets the visitor count
entry	  | Entry sensor input
exit	  | Exit sensor input

Outputs

Signal	  Description
seg0	  | Ones digit (7-segment)
seg1	  | Tens digit (7-segment)
seg2	  | Hundreds digit (7-segment)
slow_clock	| Internally generated slow clock

⏱️ Clock Divider
A clock divider is implemented using a 23-bit counter to generate a slow clock (~human speed) for reliable sensor detection.

if(counter == 5000000) begin
    counter <= 0;
    slow_clock <= ~slow_clock;
end

🔢 Count Range

Minimum: 0
Maximum: 999
Count does not underflow or overflow

📟 7-Segment Display Encoding

Common-anode configuration
Digits 0–9 are decoded using combinational logic
Three displays show hundreds, tens, and ones

🧪 Simulation & Testing

Simulated using ModelSim
Tested with push buttons as sensors
Verified correct increment, decrement, and reset operation

🛠️ Tools Used

Verilog HDL
Quartus II
ModelSim
FPGA Development Board (Altera DE2 / Cyclone)

🚀 Applications

Classroom or lab visitor counting
Mall / office people counting
Entry–exit monitoring systems
FPGA learning & digital design practice

📂 File Structure
├── visitor_counter.v
├── README.md

🎥 Demo Video

A short demonstration video showing entry, exit counting and 7-segment display operation is available here: 

✍️ Author

Manthan Sabalpara
Electronics & Communication Engineering
FPGA | Verilog | Digital Design

📜 License

This project is open-source and free to use for educational purposes.

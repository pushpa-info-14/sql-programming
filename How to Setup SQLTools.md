✅ Step 1 — Verify SQL Server Is Running

Press:

Win + R → services.msc

Make sure these are Running:

SQL Server (SQLEXPRESS)

SQL Server Browser

If not → Start them.

✅ Step 2 — Enable TCP/IP (Most Common Issue)

Open:

SQL Server Configuration Manager

Go to:

SQL Server Network Configuration
→ Protocols for SQLEXPRESS

Enable:

✔ TCP/IP

Then:

Right click TCP/IP → Properties
Go to IP Addresses tab
Scroll to bottom → IPAll

Set:

TCP Dynamic Ports = (empty)
TCP Port = 1433

Click OK.

Restart:

SQL Server (SQLEXPRESS)

✅ Step 3 — Configure SQLTools Correctly

In SQLTools connection settings:

If Using Instance Name (Requires SQL Browser)
Server: localhost\SQLEXPRESS
Port: (leave empty)

Recommended (More Stable)

Use fixed port instead:

Server: localhost
Port: 1433

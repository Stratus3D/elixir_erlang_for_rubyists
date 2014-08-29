# Spawn a process
pid = spawn(worker_fun)

# Link the process calling `link` function with `pid` process
link pid

# Monitor `pid` process from the process calling the `monitor` function
monitor pid

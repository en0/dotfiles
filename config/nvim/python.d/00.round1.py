import vim

def say_hello():
    file = vim.current.buffer.name
    buffer = vim.current.buffer
    #for x in dir(vim.current.buffer):
        #print(file, x)
    #buffer.vars["foo"] = "ian laird"
    print(buffer.vars["foo"])

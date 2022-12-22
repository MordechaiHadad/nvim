return function()
    require("godbolt").setup({
        rust = { compiler = "r1570", options = { userArguments = "--emit=llvm-ir" } },
        c = { compiler = "cclang1300", options = { userArguments = "-emit-llvm" } },
        cpp = { compiler = "clang1300", options = { userArguments = "-emit-llvm" } },
    })
end

return {
    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("greeter").config)
        end
    }
}


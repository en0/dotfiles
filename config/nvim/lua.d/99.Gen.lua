
local prompts = {
    ['Generate-unit-tests-with-unittest'] = {
        replace = false,
        prompt =
            "Regarding the following code, generate unittests that provide" ..
            " completely coverage while considering all edge cases. Only output the" ..
            " result in the format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    },
    ['Generate-unit-tests-with-Pytest'] = {
        replace = false,
        prompt =
            "Regarding the following code, generate unittests using pytest that provide" ..
            " completely coverage while considering all edge cases. Only output the" ..
            " result in the format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    },
    ['Explain-this-code'] = {
        replace = false,
        prompt =
            "Provide a short description of the following code:\n" ..
            "```$filetype\n$text\n```",
    },
    ['Implement-the-missing-code'] = {
        replace = true,
        extract = "```$filetype\n(.-)```",
        prompt =
            "Regarding the following code, generate the missing parts to complete the" ..
            " implementation. Only output the result in the format" ..
            " ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    },
    ['Give-me-a-code-review'] = {
        replace = false,
        prompt = "Provide a short review of the following code:\n```$filetype\n$text\n```",
    },
    ['Ask-for-edits'] = {
        replace = true,
        extract = "```$filetype\n(.-)```",
        prompt =
            "Regarding the following code, $input - Only output the result in the format" ..
            " ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    },
    ['Ask-for-Analysis'] = {
        replace = false,
        prompt =
            "Regarding the following code, $input - Please keep your response as short" ..
            " as possible:\n```$filetype\n$text\n```",
    },
}

local gen_config = {
    model = "mistral", -- The default model to use.
    quit_map = "q", -- set keymap for close the response window
    retry_map = "<c-r>", -- set keymap to re-send the current prompt
    accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
    host = "localhost", -- The host running the Ollama service.
    port = "11434", -- The port on which the Ollama service is listening.
    display_mode = "horizontal-split", -- The display mode. Can be "float" or "split" or "horizontal-split".
    show_prompt = false, -- Shows the prompt submitted to Ollama.
    show_model = false, -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false, -- Never closes the window automatically.
    hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
    init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
    -- Function to initialize Ollama
    command = function(options)
        local body = {model = options.model, stream = true}
        return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    debug = false -- Prints errors and the command which is run.
}

require('gen').setup(gen_config)
require('gen').prompts = prompts

vim.keymap.set(
    {'n', 'v'},
    '<leader>j',
    function()
        vim.call('fzf#run', {
            source = vim.tbl_keys(prompts),
            sink = ':Gen',
        })
    end
)

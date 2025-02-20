return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      prompts = {
        MyCommit = {
          prompt = [[
> /Commit
The format of commit message as follows:
[<module>:<type>] <title>

<message-body>

Issue-Id: xxxx
Signed-off-by: wanglei <wanglei@lixiang.com>


You need to fill the content between the angle brackets.
The <module> where this commit belongs to.
The <type> of this commit, value must be one option from the following
list: bugfix / feature / doc / style / test / refactor.
Limit each line to a Maximum of 72 characters.
If it exceeds 72 characters, line feed the last word that exceeds it.

Example:
[xxxx:feature] implement custom memory allocator for cJSON

Add Rust memory allocator integration with cJSON to ensure consistent
memory management. This includes:

- Add rust_malloc and rust_free callback functions
- Implement Json::init() to set custom memory hooks
- Configure cJSON to use Rust's allocator through cJSON_InitHooks
- Update documentation to reflect memory management changes

This change ensures that all memory allocations (including those from
cJSON_PrintUnformatted) are managed by Rust's allocator, preventing
memory leaks and improving safety.

Issue-Id: XXXX
Signed-off-by: wanglei <wanglei@xxxxx.com>
]],
          system_prompt = "",
          mapping = "<leader>ccmc",
          description = "My custom prompt description",
        },
      },
    },
  },
}

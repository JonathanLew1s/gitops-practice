# gitops-practice

A practice repository for the "Git, GitOps and Kubernetes" session. Nothing here is real.
Edit files in the GitHub web editor, open pull requests, and watch the checks run.

- `config/shop.yaml`: a pretend application, written the way a platform would describe it
- `.github/workflows/`: two automatic checks that run on every pull request
  - **standards**: every application must set resource limits and must not use `:latest`
  - **secrets**: no passwords, tokens or personal data in any file

Do not put anything real in this repository. Use obviously fake values such as `FAKE-TOKEN-1234`.

# Antigravity Kit - OpenCode Edition

> AI Agent templates with Skills, Agents, and Workflows adapted for OpenCode

---

## Quick Reference

| Shortcut | Agent | Description |
|----------|-------|-------------|
| `@b` | backend-specialist | Backend development |
| `@f` | frontend-specialist | Frontend/UI development |
| `@db` | debugger | Debugging & problem-solving |
| `@ba` | database-architect | Database design |
| `@se` | security-auditor | Security auditing |
| `@de` | devops-engineer | DevOps & deployment |
| `@m` | mobile-developer | Mobile development |
| `@g` | game-developer | Game development |
| `@p` | project-planner | Project planning |
| `@o` | orchestrator | Multi-agent coordination |
| `@t` | test-engineer | Testing & QA |
| `@q` | qa-automation-engineer | QA automation |
| `@pe` | performance-optimizer | Performance optimization |
| `@pt` | penetration-tester | Penetration testing |
| `@so` | seo-specialist | SEO optimization |
| `@da` | documentation-writer | Documentation |
| `@ca` | code-archaeologist | Legacy code analysis |
| `@pm` | product-manager | Product management |
| `@po` | product-owner | Product ownership |
| `@e` | explorer-agent | Codebase exploration |

---

## Commands

| Command | Description |
|---------|-------------|
| `/brainstorm` | Structured brainstorming |
| `/create` | Create new features |
| `/debug` | Debug workflow |
| `/deploy` | Deploy application |
| `/enhance` | Improve existing code |
| `/orchestrate` | Multi-agent coordination |
| `/plan` | Task breakdown |
| `/preview` | Preview changes |
| `/status` | Check project status |
| `/test` | Generate and run tests |
| `/ui-ux-pro-max` | Design with 50+ styles |

---

## Usage

### Invoke Agent
```
@b "Criar API REST para autenticação"
@f "Criar componente de login"
@db "Login retorna erro 500"
```

### Run Command
```
/brainstorm authentication system
/create landing page
/debug why login fails
```

---

## Agents (20)

### Development
| Agent | Focus | Keywords |
|-------|-------|----------|
| `backend-specialist` | APIs, server-side | backend, api, endpoint, database, auth |
| `frontend-specialist` | UI/UX, React | component, react, ui, ux, css, tailwind |
| `mobile-developer` | iOS, Android, RN | mobile, ios, android, react-native |
| `game-developer` | Game logic | game, unity, unreal, mechanics |

### Data & Infrastructure
| Agent | Focus | Keywords |
|-------|-------|----------|
| `database-architect` | Schema, SQL | database, schema, sql, migration |
| `devops-engineer` | CI/CD, Docker | docker, ci/cd, deploy, kubernetes |

### Security
| Agent | Focus | Keywords |
|-------|-------|----------|
| `security-auditor` | Code security | security, audit, vulnerability |
| `penetration-tester` | Pentest | pentest, exploit,渗透 |

### Quality
| Agent | Focus | Keywords |
|-------|-------|----------|
| `test-engineer` | Testing strategy | test, jest, vitest, coverage |
| `qa-automation-engineer` | E2E automation | e2e, playwright, cypress, automation |
| `debugger` | Root cause analysis | bug, error, issue, debug |
| `performance-optimizer` | Speed, Web Vitals | performance, optimize, speed |

### Planning & Management
| Agent | Focus | Keywords |
|-------|-------|----------|
| `project-planner` | Task planning | plan, task, roadmap |
| `product-manager` | Requirements | requirement, feature, user-story |
| `product-owner` | MVP, backlog | mvp, priority, backlog |

### Analysis & Documentation
| Agent | Focus | Keywords |
|-------|-------|----------|
| `explorer-agent` | Codebase analysis | explore, analyze, find |
| `code-archaeologist` | Legacy refactoring | legacy, refactor, migrate |
| `documentation-writer` | Technical docs | docs, readme, manual |

### Special
| Agent | Focus | Keywords |
|-------|-------|----------|
| `orchestrator` | Multi-agent | orchestrate, coordinate |
| `seo-specialist` | SEO | seo, ranking, google |

---

## Skills (36+)

### Frontend
- `react-patterns` - React hooks, state, performance
- `nextjs-best-practices` - Next.js App Router
- `tailwind-patterns` - Tailwind CSS v4
- `frontend-design` - UI/UX patterns

### Backend
- `api-patterns` - REST, GraphQL, tRPC
- `nodejs-best-practices` - Node.js async
- `python-patterns` - Python, FastAPI

### Database
- `database-design` - Schema, optimization

### Testing
- `testing-patterns` - Jest, Vitest
- `tdd-workflow` - Test-driven development
- `webapp-testing` - E2E, Playwright

### Security
- `vulnerability-scanner` - OWASP
- `red-team-tactics` - Offensive security

### Other
- `clean-code` - Coding standards
- `deployment-procedures` - CI/CD
- `performance-profiling` - Web Vitals
- `systematic-debugging` - Troubleshooting
- `seo-fundamentals` - SEO basics
- `bash-linux` - Linux commands

---

## Setup

```bash
# Clone
git clone https://github.com/Iluminatto1970/antigravity-kit.git
cd antigravity-kit

# Initialize OpenCode
opencode

# Run /init in OpenCode to detect agents
```

---

## Examples

```
@b "Criar endpoint POST /api/auth/login com JWT"
@f "Criar botão de theme toggle com animação"
@db "Session storage não persiste após refresh"
/plan implementar sistema de notificações
/enhance melhorar performance da tabela
```

---

MIT © Iluminatto1970

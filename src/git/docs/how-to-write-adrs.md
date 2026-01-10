# How to Write Architecture Decision Records (ADRs)

## Quick Start Guide

### Step 1: Determine if You Need an ADR
Ask yourself:
- Will this decision have lasting impact on the system?
- Are there significant trade-offs to consider?
- Would future team members benefit from knowing why we chose this approach?
- Are we choosing between multiple viable alternatives?

If you answer "yes" to any of these, create an ADR.

### Step 2: Choose Your Template
For beginners, start with **MADR Light**:
```markdown
# [Title describing the decision]

## Context and Problem Statement
[Describe the situation and what needs to be decided]

## Considered Options
- [Option 1]
- [Option 2]
- [Option 3]

## Decision Outcome
Chosen option: [Your choice], because [justification]

## Consequences
* Good, because [positive consequence]
* Bad, because [negative consequence]
```

### Step 3: Write Your ADR
Follow the detailed guidance below for each section.

## Detailed Writing Guide

### Title
**Purpose**: Capture the essence of the decision in a single, clear sentence.

**Good Examples**:
- "Use PostgreSQL as the primary database for user data"
- "Implement API authentication using JWT tokens instead of sessions"
- "Choose React over Angular for the frontend framework"
- "Deploy services using Docker containers instead of virtual machines"

**Bad Examples**:
- "Database decision" (too vague)
- "Authentication" (not a decision)
- "Frontend stuff" (unclear and informal)

**Tips**:
- Start with an action verb (Use, Implement, Choose, Adopt, etc.)
- Include both the problem and solution aspects
- Keep it under 20 words when possible

### Context and Problem Statement
**Purpose**: Set the stage by describing the situation that led to this decision.

**What to Include**:
- The business or technical context
- What problem needs to be solved
- Any constraints or requirements
- Why this decision is needed now

**Good Example**:
```markdown
## Context and Problem Statement
Our application needs to handle user authentication for both web and mobile clients. 
Currently, we have no authentication system in place. We need to choose an approach 
that will work across different client types, scale with our user base, and integrate 
with our existing Node.js backend. The solution must be secure, performant, and 
easy to implement within our 3-month timeline.
```

**Bad Example**:
```markdown
## Context and Problem Statement
We need authentication for our app.
```

**Questions to Answer**:
- What is the current state?
- What problem are we trying to solve?
- What are the key requirements or constraints?
- Why is this decision important now?

### Decision Drivers
**Purpose**: Identify the criteria that will be used to evaluate options.

**Common Decision Drivers**:
- Performance requirements
- Security needs
- Scalability concerns
- Development time constraints
- Team expertise
- Cost considerations
- Maintainability
- Integration requirements

**Good Example**:
```markdown
## Decision Drivers
* Must support both web and mobile clients
* Needs to handle 10,000+ concurrent users
* Must integrate with existing Node.js backend
* Development time limited to 2 weeks
* Team has experience with JWT but not OAuth
* Must be secure against common attacks
* Should minimize server-side session storage
```

### Considered Options
**Purpose**: Show that multiple alternatives were evaluated.

**What to Include**:
- List all viable alternatives you considered
- Briefly describe each option
- Include the status quo if relevant
- Don't include obviously poor choices

**Good Example**:
```markdown
## Considered Options
* **JWT (JSON Web Tokens)**: Stateless authentication tokens
* **Session-based authentication**: Server-side sessions with cookies
* **OAuth 2.0**: Third-party authentication provider
* **API Keys**: Simple key-based authentication
```

**Tips**:
- Research at least 3-4 options
- Include both technical and non-technical alternatives
- Be honest about options you seriously considered
- Don't include straw man options just to dismiss them

### Decision Outcome
**Purpose**: Clearly state what was chosen and why.

**Structure**:
```markdown
## Decision Outcome
Chosen option: [Specific choice], because [clear justification]
```

**Good Example**:
```markdown
## Decision Outcome
Chosen option: JWT with refresh tokens, because it provides stateless 
authentication that works well for both web and mobile clients, requires 
no server-side session storage, and our team has prior experience with 
the implementation. While OAuth 2.0 was considered, the additional 
complexity and third-party dependency were not justified for our use case.
```

**Tips**:
- Be specific about the exact choice
- Connect the justification to your decision drivers
- Explain why this option was better than the alternatives
- Keep it focused on the most important reasons

### Consequences
**Purpose**: Document both positive and negative outcomes of the decision.

**Structure**:
```markdown
## Consequences
* Good, because [positive outcome]
* Good, because [another positive outcome]
* Bad, because [negative outcome]
* Bad, because [another negative outcome]
```

**Good Example**:
```markdown
## Consequences
* Good, because no server-side session storage is needed
* Good, because tokens work seamlessly across web and mobile
* Good, because implementation can be completed within 2 weeks
* Bad, because token revocation is more complex than sessions
* Bad, because we need to implement secure token storage on client side
* Bad, because token size adds overhead to each API request
```

**Tips**:
- Always include both positive and negative consequences
- Be specific about the impacts
- Think about short-term and long-term consequences
- Consider impacts on different stakeholders

### Validation
**Purpose**: Explain how you'll verify the decision was implemented correctly.

**Good Example**:
```markdown
## Validation
* Security audit will test token implementation
* Load testing will verify performance with 10,000+ users
* Mobile team will test token storage and refresh flow
* Code review will ensure proper token validation
```

## Advanced Sections (Optional)

### Pros and Cons of Options
**When to Use**: When the decision is particularly complex or controversial.

**Format**:
```markdown
## Pros and Cons of Options

### JWT
* Good: Stateless, scalable
* Good: Works across clients
* Bad: Token revocation complexity
* Bad: Requires secure client storage

### Session-based
* Good: Simple to implement
* Good: Easy session invalidation
* Bad: Requires session storage
* Bad: Doesn't work well for mobile
```

### More Information
**When to Use**: When there are relevant links, diagrams, or additional context.

**Include**:
- Links to relevant documentation
- Performance benchmarks
- Security analysis
- Team discussion notes
- Related ADRs

## Writing Tips

### Be Specific
**Bad**: "We chose this for performance reasons"
**Good**: "We chose this because it reduces API response time by 200ms under peak load"

### Use Active Voice
**Bad**: "It was decided that the system would use PostgreSQL"
**Good**: "We chose PostgreSQL"

### Include Numbers When Possible
**Bad**: "This solution scales better"
**Good**: "This solution handles 10,000 concurrent users vs. 1,000 with the alternative"

### Be Honest About Trade-offs
Every decision has downsides. Acknowledging them builds trust and helps future readers understand the full picture.

### Write for the Future Reader
Imagine someone reading this ADR in 2 years. What context will they need? What questions will they have?

## Common Mistakes to Avoid

### Being Too Vague
```markdown
# Use a database
## Context
We need to store data
## Decision
We chose PostgreSQL because it's good
```

### Not Explaining the Why
```markdown
# Use React
## Decision
We chose React
```

### Ignoring Alternatives
```markdown
# Use AWS
## Context
We need cloud hosting
## Decision
We chose AWS
## Consequences
Good: It works well
```

### Being Too Technical
```markdown
# Implement authentication
## Context
The JWT implementation uses HS256 algorithm with 256-bit secret key
## Decision
We implemented custom JWT validation middleware
```

## Template Examples

### Simple Decision (MADR Light)
```markdown
# Use Redis for session storage

## Context and Problem Statement
Our application needs to share session data across multiple server instances. 
Currently, sessions are stored in memory on each server, causing users to 
be logged out when load balancer switches them to a different server.

## Considered Options
* Redis cluster
* Database session storage
* Sticky sessions

## Decision Outcome
Chosen option: Redis cluster, because it provides fast, shared session 
storage that works across all server instances and can handle our 
expected load of 5,000 concurrent sessions.

## Consequences
* Good, because users stay logged in across server switches
* Good, because Redis performance is excellent for session data
* Bad, because we need to maintain a Redis cluster
* Bad, because session data is lost if Redis goes down
```

### Complex Decision (Full MADR)
```markdown
# Migrate from monolith to microservices architecture

## Status
Proposed

## Context and Problem Statement
Our monolithic application has grown to 500K lines of code with 50+ developers. 
Deployment takes 4 hours, and a single bug can bring down the entire system. 
We need to improve scalability, deployment speed, and team autonomy while 
maintaining system reliability.

## Decision Drivers
* Reduce deployment time from 4 hours to under 30 minutes
* Enable independent deployment by 5 feature teams
* Improve system availability (target 99.9% uptime)
* Support 10x growth in user base over 2 years
* Maintain existing functionality during migration

## Considered Options
* Strangler Fig pattern: Gradually replace monolith components
* Big Bang rewrite: Complete rewrite in one release
* Modular monolith: Restructure without full decomposition
* Keep current architecture: Optimize existing system

## Decision Outcome
Chosen option: Strangler Fig pattern, because it allows gradual migration 
with lower risk, maintains system availability during transition, and 
provides value incrementally. Big Bang was rejected due to high risk, 
while modular monolith wouldn't achieve our scalability goals.

## Consequences
* Good, because we can migrate incrementally with lower risk
* Good, because teams can work independently on different services
* Good, because we learn microservices patterns gradually
* Bad, because we'll maintain two architectures during migration
* Bad, because initial complexity increases
* Bad, because migration will take 12-18 months

## Validation
* Each service migration will include rollback plan
* Performance benchmarks will compare old vs. new components
* Team satisfaction surveys will track developer experience
* Deployment frequency and time will be measured monthly
```

## Getting Started Checklist

- [ ] Identify a recent architectural decision
- [ ] Choose MADR Light template
- [ ] Write the title (problem + solution)
- [ ] Describe context and problem
- [ ] List 3-4 considered options
- [ ] State decision with justification
- [ ] Document positive and negative consequences
- [ ] Save in `docs/adl/` with consistent naming
- [ ] Share with team for feedback
- [ ] Iterate based on feedback

Remember: The perfect ADR is the one that gets written. Start simple and improve over time.
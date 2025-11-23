**Access Role Manager – Clarity Smart Contract**

A lightweight, modular, and secure **role-based access control (RBAC)** smart contract built for the Stacks blockchain. This contract enables developers to manage permissions for principals on-chain, enforce trusted roles, and integrate access logic into decentralized applications.

---

**Features**

**Owner-controlled administration**
**Assign and revoke roles** for any principal
**Check role membership** for authorization
**Secure and lightweight design**
**Extendable structure** for future role systems or permissions

---

**Contract Overview**

The **access-role-manager** contract provides:

**Data Maps**

* `roles` — Stores assigned roles for principals
  `(map (principal, role) → bool)`

**Key Functions**

| Function      | Type      | Description                                   |
| ------------- | --------- | --------------------------------------------- |
| `set-role`    | Public    | Assigns a role to a principal (owner-only).   |
| `revoke-role` | Public    | Removes a role from a principal (owner-only). |
| `has-role?`   | Read-only | Checks if a principal has a specific role.    |
| `get-owner`   | Read-only | Returns the contract owner.                   |

---

**Usage**

**Assign a Role**

```clarity
(contract-call? .access-role-manager set-role tx-sender "admin")
```

**Revoke a Role**

```clarity
(contract-call? .access-role-manager revoke-role tx-sender "admin")
```

**Check if a User Has a Role**

```clarity
(contract-call? .access-role-manager has-role? tx-sender "admin")
```

---

**Security Model**

* Only the **contract owner** can modify roles.
* Role checks are **read-only** and cost-efficient.
* Designed to integrate with other contracts that require permission gating.

---

**Project Structure**

```
/contracts
   └── access-role-manager.clar
/tests
   └── access-role-manager_test.ts
README.md
```

---

**Testing (Clarinet)**

Run tests using:

```bash
clarinet test
```

Example test goals:

* Owner can set and revoke roles
* Non-owner cannot assign roles
* `has-role?` returns correct values

---

**License**

This project is open-source and available under the **MIT License**.

---

Contributions

Community contributions are welcome!
Feel free to submit issues or pull requests to improve functionality and security.

---


Just tell me!

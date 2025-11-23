;; access-role-manager.clar
;; A lightweight role-based access control system.

;; Added missing data map definition for roles
(define-map roles {user: principal, role: (string-ascii 32)} {granted: bool})

;; Added admin principal constant - contract deployer
(define-data-var admin principal tx-sender)

;; Added missing assert-admin function
(define-private (assert-admin)
  (if (is-eq tx-sender (var-get admin))
    (ok true)
    (err u1)
  )
)

(define-read-only (has-role (user principal) (role (string-ascii 32)))
  ;; Fixed map-get syntax: use map-get? with curly braces for composite keys
  (match (map-get? roles {user: user, role: role})
    entry (ok (get granted entry))
    (err u0)
  )
)


;; Assign a role to a user (admin only)
(define-public (grant-role (user principal) (role (string-ascii 32)))
  (begin
    (try! (assert-admin))
    ;; Fixed map-set syntax: use curly braces for both key and value
    (map-set roles {user: user, role: role} {granted: true})
    (ok true)
  )
)

;; Remove a role from a user (admin only)
(define-public (revoke-role (user principal) (role (string-ascii 32)))
  (begin
    (try! (assert-admin))
    ;; Fixed map-set syntax: use curly braces for both key and value
    (map-set roles {user: user, role: role} {granted: false})
    (ok true)
  )
)

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Student Registration – First Quad Tech Institute</title>
  <style>
    :root {
      --bg: #0f172a;          /* slate-900 */
      --card: #111827;        /* gray-900 */
      --muted: #94a3b8;       /* slate-400 */
      --text: #e5e7eb;        /* gray-200 */
      --accent: #22c55e;      /* green-500 */
      --accent-2: #3b82f6;    /* blue-500 */
      --danger: #ef4444;      /* red-500 */
      --ring: rgba(59,130,246,.5); /* blue-500/50 */
    }

    * { box-sizing: border-box; }
    body { 
      margin: 0; font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, Arial, "Apple Color Emoji", "Segoe UI Emoji"; 
      background: radial-gradient(1200px 800px at 10% -20%, #1e293b 0, transparent 60%),
                  radial-gradient(1000px 600px at 110% 20%, #1f2937 0, transparent 60%),
                  var(--bg);
      color: var(--text);
      min-height: 100vh;
      display: grid;
      place-items: center;
      padding: 24px;
    }

    .card {
      width: 100%;
      max-width: 860px;
      background: linear-gradient(180deg, rgba(255,255,255,.03), transparent), var(--card);
      border: 1px solid rgba(255,255,255,.06);
      border-radius: 18px;
      box-shadow: 0 10px 30px rgba(0,0,0,.35);
      overflow: hidden;
    }

    header {
      padding: 24px 28px 16px 28px;
      border-bottom: 1px solid rgba(255,255,255,.06);
    }
    header h1 { margin: 0 0 6px 0; font-size: 1.5rem; }
    header p { margin: 0; color: var(--muted); font-size: .95rem; }

    form { padding: 24px 28px 32px 28px; }

    .grid {
      display: grid;
      grid-template-columns: repeat(12, 1fr);
      gap: 16px;
    }

    .col-12 { grid-column: span 12; }
    .col-6  { grid-column: span 6; }
    .col-4  { grid-column: span 4; }
    .col-3  { grid-column: span 3; }

    @media (max-width: 720px) {
      .col-6, .col-4, .col-3 { grid-column: span 12; }
    }

    label { display: block; margin-bottom: 6px; font-weight: 600; }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="date"],
    input[type="file"],
    select,
    textarea {
      width: 100%;
      padding: 12px 12px;
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,.1);
      background: rgba(17,24,39,.7);
      color: var(--text);
      outline: none;
    }

    textarea { min-height: 96px; resize: vertical; }

    input:focus,
    select:focus,
    textarea:focus {
      border-color: var(--accent-2);
      box-shadow: 0 0 0 4px var(--ring);
    }

    .help { color: var(--muted); font-size: .85rem; margin-top: 4px; }
    .error { color: var(--danger); font-size: .85rem; margin-top: 4px; display: none; }

    fieldset {
      border: 1px dashed rgba(255,255,255,.12);
      border-radius: 14px;
      padding: 14px 16px 8px 16px;
    }

    legend { color: var(--muted); padding: 0 8px; font-size: .9rem; }

    .row { display: flex; align-items: center; gap: 16px; flex-wrap: wrap; }

    .actions { display: flex; gap: 12px; margin-top: 8px; }

    button {
      padding: 12px 16px;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      font-weight: 600;
    }
    .btn-primary { background: var(--accent-2); color: white; }
    .btn-secondary { background: rgba(255,255,255,.09); color: var(--text); }
    .btn-primary:focus, .btn-secondary:focus { box-shadow: 0 0 0 4px var(--ring); }

    .footer { margin-top: 20px; color: var(--muted); font-size: .9rem; }

    .success {
      display: none;
      margin-top: 16px;
      padding: 12px 14px;
      border-radius: 12px;
      background: rgba(34,197,94,.12);
      border: 1px solid rgba(34,197,94,.35);
      color: #bbf7d0;
    }
  </style>
</head>
<body>
  <div class="card" role="region" aria-label="Student registration form">
    <header>
      <h1>Student Registration</h1>
      <p>Enroll for programs at First Quad Tech Institute, Baner, Pune – 411071</p>
    </header>

    <form id="studentForm" action="register_student.php" method="post" enctype="multipart/form-data" autocomplete="on" novalidate>
      <div class="grid">
        <div class="col-6">
          <label for="fullName">Full Name</label>
          <input type="text" id="fullName" name="fullName" placeholder="e.g., Suresh Patil" required minlength="3" />
          <div class="error" id="err-fullName">Please enter your full name (min 3 characters).</div>
        </div>

        <div class="col-6">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="you@example.com" required />
          <div class="error" id="err-email">Please enter a valid email address.</div>
        </div>

        <div class="col-6">
          <label for="phone">Mobile Number</label>
          <input type="tel" id="phone" name="phone" placeholder="10-digit mobile number" required pattern="^[0-9]{10}$" />
          <div class="help">Numbers only, 10 digits.</div>
          <div class="error" id="err-phone">Enter a valid 10-digit mobile number.</div>
        </div>

        <div class="col-6">
          <label for="dob">Date of Birth</label>
          <input type="date" id="dob" name="dob" required />
          <div class="error" id="err-dob">Please select a valid birth date (age 16+).</div>
        </div>

        <div class="col-12">
          <fieldset>
            <legend>Gender</legend>
            <div class="row" role="group" aria-labelledby="gender">
              <label><input type="radio" name="gender" value="Male" required /> Male</label>
              <label><input type="radio" name="gender" value="Female" /> Female</label>
              <label><input type="radio" name="gender" value="Other" /> Other</label>
            </div>
            <div class="error" id="err-gender">Please choose a gender option.</div>
          </fieldset>
        </div>

        <div class="col-12">
          <label for="address">Address</label>
          <textarea id="address" name="address" placeholder="House no, Street, Area" required></textarea>
          <div class="error" id="err-address">Address is required.</div>
        </div>

        <div class="col-4">
          <label for="city">City</label>
          <input type="text" id="city" name="city" placeholder="Pune" required />
          <div class="error" id="err-city">City is required.</div>
        </div>

        <div class="col-4">
          <label for="state">State</label>
          <input type="text" id="state" name="state" placeholder="Maharashtra" required />
          <div class="error" id="err-state">State is required.</div>
        </div>

        <div class="col-4">
          <label for="pincode">Pincode</label>
          <input type="text" id="pincode" name="pincode" placeholder="6-digit pincode" required pattern="^[1-9][0-9]{5}$" />
          <div class="error" id="err-pincode">Enter a valid 6-digit pincode.</div>
        </div>

        <div class="col-6">
          <label for="program">Program</label>
          <select id="program" name="program" required>
            <option value="" disabled selected>Select a program</option>
            <option>DevOps Engineering</option>
            <option>Data Science</option>
            <option>Cloud Computing (AWS/Azure/GCP)</option>
            <option>Full-Stack Web Development</option>
            <option>Cybersecurity</option>
          </select>
          <div class="error" id="err-program">Please select a program.</div>
        </div>

        <div class="col-6">
          <label for="intake">Intake</label>
          <select id="intake" name="intake" required>
            <option value="" disabled selected>Select intake</option>
            <option>January 2025</option>
            <option>March 2025</option>
            <option>June 2025</option>
            <option>September 2025</option>
            <option>January 2026</option>
          </select>
          <div class="error" id="err-intake">Please select an intake.</div>
        </div>

        <div class="col-6">
          <label for="studentId">Student ID (optional)</label>
          <input type="text" id="studentId" name="studentId" placeholder="Auto/Manual e.g., FQ-2025-001" />
        </div>

        <div class="col-6">
          <label for="photo">Upload Photo (optional)</label>
          <input type="file" id="photo" name="photo" accept="image/*" />
          <div class="help">Max 2 MB. JPG or PNG recommended.</div>
        </div>

        <div class="col-12">
          <label>
            <input type="checkbox" id="agree" name="agree" required />
            I confirm the above information is correct and I agree to the Terms & Privacy.
          </label>
          <div class="error" id="err-agree">You must agree before submitting.</div>
        </div>

        <div class="col-12 actions">
          <button type="submit" class="btn-primary">Register</button>
          <button type="reset" class="btn-secondary">Reset</button>
        </div>

        <div class="col-12 success" id="successBox" role="alert" aria-live="polite">
          ✅ Registration submitted successfully (demo). You can connect this form to your backend at <code>register_student.php</code>.
        </div>

        <div class="col-12 footer">
          Already registered? <a href="#" style="color: #93c5fd; text-decoration: none;">Sign in here</a>.
        </div>
      </div>
    </form>
  </div>

  <script>
    (function () {
      const form = document.getElementById('studentForm');
      const successBox = document.getElementById('successBox');

      function setError(id, show) {
        const el = document.getElementById(id);
        if (el) el.style.display = show ? 'block' : 'none';
      }

      function ageValid(dobStr) {
        if (!dobStr) return false;
        const today = new Date();
        const dob = new Date(dobStr);
        let age = today.getFullYear() - dob.getFullYear();
        const m = today.getMonth() - dob.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) age--;
        return age >= 16; // minimum age 16
      }

      form.addEventListener('submit', function (e) {
        e.preventDefault();
        successBox.style.display = 'none';

        // Basic HTML5 checks
        let valid = true;

        // Name
        const fullName = document.getElementById('fullName');
        if (!fullName.value || fullName.value.trim().length < 3) { setError('err-fullName', true); valid = false; } else { setError('err-fullName', false); }

        // Email
        const email = document.getElementById('email');
        if (!email.checkValidity()) { setError('err-email', true); valid = false; } else { setError('err-email', false); }

        // Phone
        const phone = document.getElementById('phone');
        if (!phone.checkValidity()) { setError('err-phone', true); valid = false; } else { setError('err-phone', false); }

        // DOB
        const dob = document.getElementById('dob');
        if (!dob.value || !ageValid(dob.value)) { setError('err-dob', true); valid = false; } else { setError('err-dob', false); }

        // Gender
        const genderChecked = !!document.querySelector('input[name="gender"]:checked');
        if (!genderChecked) { setError('err-gender', true); valid = false; } else { setError('err-gender', false); }

        // Address
        const address = document.getElementById('address');
        if (!address.value.trim()) { setError('err-address', true); valid = false; } else { setError('err-address', false); }

        // City/State
        const city = document.getElementById('city');
        const state = document.getElementById('state');
        if (!city.value.trim()) { setError('err-city', true); valid = false; } else { setError('err-city', false); }
        if (!state.value.trim()) { setError('err-state', true); valid = false; } else { setError('err-state', false); }

        // Pincode
        const pincode = document.getElementById('pincode');
        if (!pincode.checkValidity()) { setError('err-pincode', true); valid = false; } else { setError('err-pincode', false); }

        // Program/Intake
        const program = document.getElementById('program');
        const intake = document.getElementById('intake');
        if (!program.value) { setError('err-program', true); valid = false; } else { setError('err-program', false); }
        if (!intake.value) { setError('err-intake', true); valid = false; } else { setError('err-intake', false); }

        // Agree
        const agree = document.getElementById('agree');
        if (!agree.checked) { setError('err-agree', true); valid = false; } else { setError('err-agree', false); }

        if (valid) {
          // In real use, remove preventDefault and let the form submit to your backend.
          successBox.style.display = 'block';
          form.reset();
          // Keep the selected placeholders after reset
          document.getElementById('program').selectedIndex = 0;
          document.getElementById('intake').selectedIndex = 0;
        }
      });

      // Hide error on input
      Array.from(form.elements).forEach(el => {
        el.addEventListener('input', () => {
          const map = {
            fullName: 'err-fullName',
            email: 'err-email',
            phone: 'err-phone',
            dob: 'err-dob',
            address: 'err-address',
            city: 'err-city',
            state: 'err-state',
            pincode: 'err-pincode',
            program: 'err-program',
            intake: 'err-intake',
            agree: 'err-agree'
          };
          if (map[el.id]) setError(map[el.id], false);
        });
      });
    })();
  </script>
</body>
</html>

---
name: Field Technician Precision
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#434655'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#737686'
  outline-variant: '#c3c6d7'
  surface-tint: '#0053db'
  primary: '#004ac6'
  on-primary: '#ffffff'
  primary-container: '#2563eb'
  on-primary-container: '#eeefff'
  inverse-primary: '#b4c5ff'
  secondary: '#565e74'
  on-secondary: '#ffffff'
  secondary-container: '#dae2fd'
  on-secondary-container: '#5c647a'
  tertiary: '#006242'
  on-tertiary: '#ffffff'
  tertiary-container: '#007d55'
  on-tertiary-container: '#bdffdb'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#dbe1ff'
  primary-fixed-dim: '#b4c5ff'
  on-primary-fixed: '#00174b'
  on-primary-fixed-variant: '#003ea8'
  secondary-fixed: '#dae2fd'
  secondary-fixed-dim: '#bec6e0'
  on-secondary-fixed: '#131b2e'
  on-secondary-fixed-variant: '#3f465c'
  tertiary-fixed: '#6ffbbe'
  tertiary-fixed-dim: '#4edea3'
  on-tertiary-fixed: '#002113'
  on-tertiary-fixed-variant: '#005236'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
typography:
  headline-xl:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-xl-mobile:
    fontFamily: Inter
    fontSize: 26px
    fontWeight: '700'
    lineHeight: 34px
  headline-lg:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  title-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '600'
    lineHeight: 24px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '600'
    lineHeight: 14px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style
The design system establishes a high-reliability, service-tech aesthetic tailored for on-demand field service workflows, technician dispatch, and device diagnostic tracking. The personality balances enterprise utility with rapid operational clarity—instilling customer trust while maximizing technician efficiency under diverse lighting and field conditions. 

The aesthetic merges modern structural materialism with tactile functional clarity: crisp contrasting elements, structured metadata groupings, unambiguous visual telemetry, and intentional color coding. Visual clutter is stripped away to highlight actionable service states, device specifications, and logistical timelines.

## Colors
The color hierarchy is optimized for real-time visibility, fast scanning, and WCAG AA compliance across outdoor and mobile environments.

- **Primary Electric Blue (`#2563EB`)**: Drives primary affordances, active navigational anchors, primary action buttons, and active workflow transitions.
- **Secondary Dark Navy (`#0F172A`)**: Anchor tone for headings, critical numerical metrics, and high-emphasis structural elements.
- **Surface & Canvas**: Canvas background uses Slate 50 (`#F8FAFC`), while primary elevation containers utilize pure Card White (`#FFFFFF`). Subdued surface fills utilize Slate 100 (`#F1F5F9`) and Slate 200 (`#E2E8F0`).
- **Semantic Feedback**:
  - Success Emerald (`#10B981`): Task completion, successful diagnostic checks, confirmed payments.
  - Warning Amber (`#F59E0B`): Pending actions, technician transit, awaiting parts, delays.
  - Error Red (`#EF4444`): Hardware failure, rejected service orders, critical cancellation alerts.
- **Surface Tonality for Badges**: Status indicators pair their deep semantic tone with a 10% alpha or tint-matched container fill (e.g., `#ECFDF5` for Emerald containers, `#FEF3C7` for Amber containers, `#FEF2F2` for Red containers) to ensure high readability without visual fatigue.

## Typography
`Inter` is utilized universally across display, body, and tabular data due to its tall x-height, clear apertures, and neutral technical stance. 

- **Number Rendering**: Use tabular lining figures (`font-variant-numeric: tabular-nums`) for currency values (Rupiah formatting: `Rp`), serial numbers, job code identifiers, and parts pricing tables.
- **Hierarchy Mapping**:
  - `headline-xl` / `headline-xl-mobile`: Reserved for daily service summaries and primary screen titles.
  - `headline-lg` & `headline-md`: Card group titles, service order identifiers (e.g., `#VFX-202409`), and stage milestones.
  - `title-md`: Subsection labels, technician names, and device model headings.
  - `body-lg` & `body-md`: Detailed diagnostic notes, repair descriptions, and customer chat.
  - `label-sm` & `label-md`: Metadata key-value pairings, input captions, and status badge typography.

## Layout & Spacing
The layout adheres strictly to an 8-point base grid system (with a secondary 4-point scale for fine-grained icon-to-label alignment).

- **Screen Margins**: Outer canvas padding defaults to `1rem` (16px) on compact handheld devices, extending to `1.5rem` (24px) on tablet split-pane layouts.
- **Card Internals**: All primary service cards use `1rem` (16px) internal padding, with dense list tiles utilizing `0.75rem` (12px).
- **Form Factor Reflow**:
  - **Mobile (<600dp)**: Single-column vertical layout with pinned sticky bottom actions (CTAs) and prominent FAB placement.
  - **Tablet (600dp–1024dp)**: Two-column master-detail view; job queue on left pane (360dp fixed), interactive diagnostic sheet and parts invoice on right fluid pane.

## Elevation & Depth
Depth hierarchy follows Material 3 spatial layering, avoiding heavy drop shadows in favor of ambient, soft-contact occlusion tinted slightly with slate navy (`#0F172A`).

- **Level 0 (Flat)**: Background canvas (`#F8FAFC`), embedded inactive sections, table headers.
- **Level 1 (Card & Containers)**: Primary repair cards, client information modules, and diagnostic logs. Rendered with background `#FFFFFF`, border `1px solid #E2E8F0`, and shadow: `0px 1px 3px rgba(15, 23, 42, 0.06), 0px 1px 2px rgba(15, 23, 42, 0.04)`.
- **Level 2 (Dropdowns & Interactive Sheets)**: Filter menus, bottom sheets, search overlays. Shadow: `0px 4px 6px -1px rgba(15, 23, 42, 0.08), 0px 2px 4px -2px rgba(15, 23, 42, 0.04)`.
- **Level 3 (Floating Action Button & Dialogs)**: Action anchors and confirmation alerts. FAB uses `#2563EB` with shadow: `0px 8px 16px -2px rgba(37, 99, 235, 0.3)`.

## Shapes
Shapes define modular encapsulation and structural order.

- **Primary Cards & Modals**: Standardized at `1rem` (16px border radius) to create approachable, distinct card boundaries on high-density displays.
- **Inner Modules, Inputs & Nested Panels**: Scaled to `0.75rem` (12px border radius) to maintain concentric proportions inside primary cards.
- **Pill Badges & Buttons**: Buttons and status tags utilize full pill contours (`9999px`) or compact `0.5rem` (8px) geometry depending on container density. Status pill tags strictly use `9999px` capsule radii.

## Components

### Status Pill Badges
Capsule-shaped indicators (`padding: 4px 10px`, border radius `9999px`) featuring a leading 6px colored dot indicator and `label-sm` bold typography. Localized states and tokens:
- **Menunggu Persetujuan**: Background `#FEF3C7`, Text/Dot `#D97706` (Amber)
- **Menunggu Teknisi**: Background `#F1F5F9`, Text/Dot `#475569` (Slate)
- **Ditugaskan**: Background `#EFF6FF`, Text/Dot `#2563EB` (Primary Blue)
- **Teknisi Menuju Lokasi**: Background `#EDE9FE`, Text/Dot `#7C3AED` (Purple Transit)
- **Diagnosa**: Background `#E0F2FE`, Text/Dot `#0284C7` (Sky Blue)
- **Menunggu Suku Cadang**: Background `#FFEDD5`, Text/Dot `#EA580C` (Orange)
- **Dalam Perbaikan**: Background `#FEF9C3`, Text/Dot `#CA8A04` (Yellow Accent)
- **Selesai**: Background `#ECFDF5`, Text/Dot `#10B981` (Emerald)
- **Ditutup**: Background `#F8FAFC`, Text/Dot `#64748B`, Border `#CBD5E1` (Muted Slate)
- **Ditolak**: Background `#FEF2F2`, Text/Dot `#EF4444` (Error Red)

### Buttons
- **Primary Elevated**: Height 48px, background `#2563EB`, text `#FFFFFF`, radius 12px, font `label-lg`. Active tap downscale `0.98`.
- **Secondary Outlined**: Height 48px, background `#FFFFFF`, border `1.5px solid #CBD5E1`, text `#0F172A`, radius 12px.
- **Floating Action Button (M3)**: 56x56px, background `#2563EB`, icon `#FFFFFF`, radius 16px. Used exclusively for "Tambah Tiket Servis" (New Service Order) or technician call shortcuts.

### Cards
- **Repair Order Ticket Card**: `#FFFFFF` background, 16px radius, `1px solid #E2E8F0` border. Contains header row (Job ID + Status Pill), middle block (Device model, customer name, issue summary), and footer row (Total estimate in Rupiah, time badge).

### Inputs & Form Elements
- **Text Fields**: Height 48px, background `#F8FAFC`, border `1px solid #CBD5E1`, text `#0F172A`, radius 12px. Focus state triggers `2px solid #2563EB` with `#EFF6FF` background tint.
- **Checkboxes & Radios**: 20x20px, 4px border radius for checkboxes, full circle for radios. Active state fill `#2563EB`, checkmark stroke `#FFFFFF`.

### Service Timeline & Progress Tracker
Vertical node stepper with active states indicated by 12px node dots, connecting lines (`2px solid #E2E8F0`, dynamic fill to `#2563EB` when completed), timestamp stamps, and technician action notes.